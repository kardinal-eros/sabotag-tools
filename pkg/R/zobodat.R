zobodat <-
function (genus, species, file) {

if (missing(file)) {
	file <- tempfile()
} else {
	stopifnot(is.character(file))
}
#	decoded url
#	as_b[0][i]=gattung&as_b[0][qt]=contains&as_b[0][v]=Poa&as_b[1][i]=art&as_b[1][qt]=contains&as_b[1][v]=nemoralis
url <- "http://www.zobodat.at/belege_csv.php?as_b%5B0%5D%5Bi%5D=gattung&as_b%5B0%5D%5Bqt%5D=contains&as_b%5B0%5D%5Bv%5D=GENUS&as_b%5B1%5D%5Bi%5D=art&as_b%5B1%5D%5Bqt%5D=contains&as_b%5B1%5D%5Bv%5D=SPECIES"

url <- gsub("GENUS", genus, url)
url <- gsub("SPECIES", species, url)
# ask server to set some cookies
h <- new_handle()
r <- curl_fetch_memory("http://www.zobodat.at/belege.php", handle = h)
#handle_cookies(h)


message("waiting for server, be patient")
con <- curl_fetch_disk(url, file, handle = h)

if (con$status_code == 200)
r <- zobodat.csv(file)

return(r)
}
