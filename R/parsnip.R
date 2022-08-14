library(parsnip)

spline_model <- parsnip::mars(
  num_terms = 4,
  mode = "regression",
  engine = "earth"
)

# what vetiver would produce as the required packages:
renv::snapshot(packages = c("earth", "parsnip", "workflows"), prompt = FALSE)
