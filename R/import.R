#' Import
#'
#' This function imports a variety of different data files.
#'
#' @param file name of file in path.
#' @param ... passes additional parameters into file options.
#'
#' @import haven readxl vroom
#'
#' @export
#' @return dataframe object
#' @seealso
#' * [haven::read_sas()] read sas files
#' * [haven::read_stata()] read stata files
#' * [haven::read_spss()] read spss files
#' * [readxl::read_excel()] read excel files
#' * [vroom::vroom()] reads files quicker
#' @examples
#' #import(data.csv)
import <- function(file, ...){

  # if no file specified, prompt user

  if(missing(file))
    file <- file.choose()


  # get file info

  file <- tolower(file)
  basename <- basename(file)
  extension <- tools::file_ext(file)


  # import dataset

  df <- switch(extension,
           "sas7bdat" = haven::read_sas(file, ...),
           "dta" = haven::read_stata(file, ...),
           "sav" = haven::read_spss(file, ...),
           "xlsx" = readxl::read_excel(file, ...),
           "xls" = readxl::read_excel(file, ...),
           vroom::vroom(file, ...)
           )

  # return data frame
  return(df)
}

