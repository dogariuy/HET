library(docstring)
read_plate_data <- function (file_path, experiment_id) {
  #' @description Read plate data from an excel with multiple sheets, where each experiment ID 
  #' has a corresponding sheet containing ELISpot SFUs and another sheet with the
  #' plate layout
  #' @param x character. file path of your excel
  #' @param y character. a vector containing the experiment ids you want to read in from the excel
  layout_var <- paste0("plate_layout_", experiment_id)
  data_var <- paste0("data_", experiment_id)
  
  layout_data <- read_excel(
    file_path, sheet = paste0(experiment_id, "_layout"),
    col_names = FALSE
  )
  data <- read_excel(
    file_path, sheet = paste0(experiment_id, "_data"),
    col_names = FALSE
  )
  
  assign(layout_var, layout_data, envir = .GlobalEnv)
  assign(data_var, data, envir = .GlobalEnv)
}

docstring(read_plate_data)