% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PqConnection.R
\docType{methods}
\name{dbConnect,PqDriver-method}
\alias{dbConnect,PqDriver-method}
\alias{dbDisconnect,PqConnection-method}
\title{Connect to a PostgreSQL database.}
\usage{
\S4method{dbConnect}{PqDriver}(drv, dbname = NULL, host = NULL,
  port = NULL, password = NULL, user = NULL, service = NULL, ...,
  bigint = c("integer64", "integer", "numeric", "character"),
  check_interrupts = FALSE)

\S4method{dbDisconnect}{PqConnection}(conn, ...)
}
\arguments{
\item{drv}{\code{RPostgres::Postgres()}}

\item{dbname}{Database name. If \code{NULL}, defaults to the user name.
Note that this argument can only contain the database name, it will not
be parsed as a connection string (internally, \code{expand_dbname} is set to
\code{false} in the call to
\href{https://www.postgresql.org/docs/9.6/static/libpq-connect.html}{PQconnectdbParams()}).}

\item{host, port}{Host and port. If \code{NULL}, will be retrieved from
\code{PGHOST} and \code{PGPORT} env vars.}

\item{user, password}{User name and password. If \code{NULL}, will be
retrieved from \code{PGUSER} and \code{PGPASSWORD} envvars, or from the
appropriate line in \code{~/.pgpass}. See
\url{http://www.postgresql.org/docs/9.6/static/libpq-pgpass.html} for
more details.}

\item{service}{Name of service to connect as.  If \code{NULL}, will be
ignored.  Otherwise, connection parameters will be loaded from the pg_service.conf
file and used.  See \url{http://www.postgresql.org/docs/9.6/static/libpq-pgservice.html}
for details on this file and syntax.}

\item{...}{Other name-value pairs that describe additional connection
options as described at
\url{http://www.postgresql.org/docs/9.6/static/libpq-connect.html#LIBPQ-PARAMKEYWORDS}}

\item{bigint}{The R type that 64-bit integer types should be mapped to,
default is \link[bit64:integer64]{bit64::integer64}, which allows the full range of 64 bit
integers.}

\item{check_interrupts}{Should user interrupts be checked during the query execution (before
first row of data is available)? Setting to \code{TRUE} allows interruption of queries
running too long.}

\item{conn}{Connection to disconnect.}
}
\description{
Manually disconnecting a connection is not necessary with RPostgres, but
still recommended;
if you delete the object containing the connection, it will be automatically
disconnected during the next GC with a warning.
}
\examples{
if (postgresHasDefault()) {
library(DBI)
# Pass more arguments as necessary to dbConnect()
con <- dbConnect(RPostgres::Postgres())
dbDisconnect(con)
}
}
