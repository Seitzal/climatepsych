library(tidyverse)

# Regression result summary
plot_summary_logreg <- function(model, include_intercept = FALSE, hide_insig = FALSE, threshold = 0.05) {
  if (include_intercept) {
    first <- 1
  } else {
    first <- 2
  }
  smry <- data.frame(coef(summary(model)))
  smry <- data.frame(row.names(smry), smry, row.names = NULL)
  smry <- smry %>% rename(
    Variable = row.names.smry.,
    StdErr = Std..Error,
    p = Pr...z..)
  if (hide_insig)
    smry <- smry %>% filter(p <= threshold)
  plot <- ggplot(
    smry %>% slice(first:n()),
    aes(
      x = Variable,
      y = Estimate,
      fill = p)) +
    geom_col(
      color = "black"
    ) +
    geom_errorbar(
      aes(
        ymin = Estimate - StdErr,
        ymax = Estimate + StdErr),
      width = .5,
      size = 1,
      color = "darkgray") +
    labs(fill = "p-value") +
    coord_flip()
  if (!hide_insig) {
    plot <- plot + scale_fill_gradientn(
      breaks = c(0, 0.001, 0.01, 0.05, 0.1, 0.25, 0.5, 1),
      colours = c("darkblue", "purple", "magenta", "red", "darkred"),
      values = c(0, 0.05, 0.1, 0.25, 1),
      guide = "legend")
  } else {
    plot <- plot + scale_fill_gradient(low = "darkblue", high = "purple")
  }
  plot
}

# Correlation Heatmap
plot_corheat <- function(data, method = "pearson", lowerhalf = FALSE) {

  cm <-
    as.data.frame(cor(data %>% mutate_if(is.factor, as.numeric) %>% drop_na(), method = method)) %>%
    rownames_to_column(var = "X") %>%
    gather("Y", "r", -X)
  
  if (!lowerhalf)
    cm <- cm %>% mutate(r = r %>% replace(X > Y, 0))
  
  ggplot(cm, aes(X, Y, fill = r)) +
    geom_tile() +
    scale_fill_gradient2(low = "darkred", mid = "white", midpoint = 0, high = "darkblue") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)) +
    scale_x_discrete(position = "top") +
    labs(fill = method)
}
