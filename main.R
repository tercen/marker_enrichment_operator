library(tercen)
library(dplyr)

options(dplyr.summarise.inform = FALSE)

get.score <- function(df_in) {
  global_median <- median(df_in$.y, na.rm = TRUE)
  df_out <- df_in %>% 
    group_by(.ri, .ci) %>%
    summarise(
      col_median = median(.y, na.rm = TRUE),
      col_mad = median(abs(.y - col_median), na.rm = TRUE),
      global_mad = median(abs(.y - global_median), na.rm = TRUE),
      global_median = global_median,
      score = 0.6745 * (col_median - global_median) / col_mad # not a magic number
    ) %>%
    ungroup() %>%
    mutate(scl = mean(range(col_median))) %>%
    mutate(score = score - scl) %>%
    select(.ri, .ci, score) %>%
    mutate(
      p_value = 2 * pnorm(abs(score), lower.tail = FALSE),
      neglog_p_value = -log10(p_value)
    ) %>% 
    ungroup()
  return(df_out)
}

ctx <- tercenCtx()
ctx %>%
  select(.ci, .ri, .y) %>%
  group_by(.ri) %>%
  do(get.score(.)) %>%
  ctx$addNamespace() %>%
  ctx$save()
