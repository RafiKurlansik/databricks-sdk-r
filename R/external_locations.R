# Code generated from OpenAPI specs by Databricks SDK Generator. DO NOT EDIT.

#' @importFrom stats runif
NULL

#' Create an external location.
#' 
#' Creates a new external location entry in the metastore. The caller must be a
#' metastore admin or have the **CREATE_EXTERNAL_LOCATION** privilege on both
#' the metastore and the associated storage credential.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param comment User-provided free-form text description.
#' @param credential_name Required. Name of the storage credential used with this location.
#' @param name Required. Name of the external location.
#' @param read_only Indicates whether the external location is read-only.
#' @param skip_validation Skips validation of the storage credential associated with the external location.
#' @param url Required. Path URL of the external location.
#'
#' @rdname externalLocationsCreate
externalLocationsCreate <- function(client, name, url, credential_name, comment = NULL,
  read_only = NULL, skip_validation = NULL) {
  body <- list(comment = comment, credential_name = credential_name, name = name,
    read_only = read_only, skip_validation = skip_validation, url = url)
  client$do("POST", "/api/2.1/unity-catalog/external-locations", body = body)
}

#' Delete an external location.
#' 
#' Deletes the specified external location from the metastore. The caller must
#' be the owner of the external location.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param force Force deletion even if there are dependent external tables or mounts.
#' @param name Required. Name of the external location.
#'
#' @rdname externalLocationsDelete
externalLocationsDelete <- function(client, name, force = NULL) {
  query <- list(force = force)
  client$do("DELETE", paste("/api/2.1/unity-catalog/external-locations/", name,
    sep = ""), query = query)
}

#' Get an external location.
#' 
#' Gets an external location from the metastore. The caller must be either a
#' metastore admin, the owner of the external location, or a user that has some
#' privilege on the external location.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param name Required. Name of the external location.
#'
#' @rdname externalLocationsGet
externalLocationsGet <- function(client, name) {

  client$do("GET", paste("/api/2.1/unity-catalog/external-locations/", name, sep = ""))
}

#' List external locations.
#' 
#' Gets an array of external locations (__ExternalLocationInfo__ objects) from
#' the metastore. The caller must be a metastore admin, the owner of the
#' external location, or a user that has some privilege on the external
#' location. There is no guarantee of a specific ordering of the elements in the
#' array.#'
#' @return `data.frame` with all of the response pages.
#'
#' @rdname externalLocationsList
externalLocationsList <- function(client) {

  json <- client$do("GET", "/api/2.1/unity-catalog/external-locations")
  return(json$external_locations)

}

#' Update an external location.
#' 
#' Updates an external location in the metastore. The caller must be the owner
#' of the external location, or be a metastore admin. In the second case, the
#' admin can only update the name of the external location.
#' @param client Required. Instance of DatabricksClient()
#'
#' @param comment User-provided free-form text description.
#' @param credential_name Name of the storage credential used with this location.
#' @param force Force update even if changing url invalidates dependent external tables or mounts.
#' @param name Name of the external location.
#' @param owner The owner of the external location.
#' @param read_only Indicates whether the external location is read-only.
#' @param url Path URL of the external location.
#'
#' @rdname externalLocationsUpdate
externalLocationsUpdate <- function(client, name, comment = NULL, credential_name = NULL,
  force = NULL, owner = NULL, read_only = NULL, url = NULL) {
  body <- list(comment = comment, credential_name = credential_name, force = force,
    name = name, owner = owner, read_only = read_only, url = url)
  client$do("PATCH", paste("/api/2.1/unity-catalog/external-locations/", name,
    sep = ""), body = body)
}

