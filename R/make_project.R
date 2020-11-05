#' Make Project
#'
#' This function creates an R project with relevant folders in project location.
#'
#' @param project name of project.
#' @param path location of project.
#' @param folders names of relevant folders to create (figures, documentation, data, reports, R)
#' @param readme readme, default is a markdown file.
#' @param git enables git, default is false.
#'
#' @export
#' @return NULL
#' @examples
#' #make_project(cats)
make_project <- function (project,
                  path = getwd(),
                  folders = c("figures", "documentation",
                              "data", "reports", "R"),
                  readme = "README.md",
                  git = FALSE) {


  # change to path location
  if(!dir.exists(path)) stop("No such path")
  setwd(path)

  # project directory
  if(!missing(project)) {
    dir.create(project)
    setwd(project)
  }

  # create subdirectories
  for (i in folders){
    dir.create(i)
  }


  # create README.md
  today <- Sys.Date()
  user  <- Sys.info()[["user"]]
  project <- basename(getwd())
  cat("# Project: ", project, "\n\n",
      "## Author: ", user, "\n\n",
      "## Date: ",   format(today, format="%B %d %Y"), "\n\n",
      "## Purpose: \n\n",
      "## Data Sources: \n\n",
      "## Stakeholders: \n\n",
      file = readme,
      sep = "")

  # create RStudio project
  usethis::create_project(".", open=FALSE)

  # add git
  if (git){
     usethis::use_git()
  }


  # activate project
  usethis::proj_activate(".")

}
