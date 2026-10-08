# Drosophila melanogaster developmental timeline
# Author: Riwaz Sangroula

library(ggplot2)

fly_data <- data.frame(
  Stage = factor(
    c(
      "Egg / Embryo",
      "1st Instar (L1)",
      "2nd Instar (L2)",
      "3rd Instar (L3)",
      "Pupa",
      "Eclosion (Adult)"
    ),
    levels = rev(
      c(
        "Egg / Embryo",
        "1st Instar (L1)",
        "2nd Instar (L2)",
        "3rd Instar (L3)",
        "Pupa",
        "Eclosion (Adult)"
      )
    )
  ),
  Start_Day = c(0, 1, 2, 4, 6, 10),
  End_Day = c(1, 2, 4, 6, 10, 10.5),
  Phase = c("Embryo", "Larva", "Larva", "Larva", "Pupa", "Adult")
)

ggplot(
  fly_data,
  aes(
    x = Start_Day,
    xend = End_Day,
    y = Stage,
    yend = Stage,
    color = Phase
  )
) +
  geom_segment(linewidth = 6, lineend = "round") +
  geom_point(aes(x = Start_Day), size = 4, color = "black") +
  scale_x_continuous(
    breaks = 0:11,
    limits = c(-0.5, 11)
  ) +
  labs(
    title = "Drosophila melanogaster Lifecycle Timeline",
    subtitle = "Chronological progression of development at 25°C",
    x = "Timeline (Days from Oviposition)",
    y = "Developmental Stage",
    color = "Phase"
  ) +
  theme_minimal()
