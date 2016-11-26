##############################################################################
### get_news_data.R
###
### Gather text and metadata from news sites identified by the BS Detector:
### https://github.com/selfagency/bs-detector
###
### Written 26 November 2016 by Megan Risdal for Kaggle
###
### Data published here: https://www.kaggle.com/mrisdal/fake-news 
###
##############################################################################

##############################################################################
# Prepare workspace and read in news urls

# clear workspace
rm(list = ls())

# load libraries
library(jsonlite)
library(curl)
library(dplyr)

# setwd and read in bs news URLs
setwd("~/GitHub/bs-news-scraper")

# labeled URLs are from 
# https://github.com/selfagency/bs-detector/blob/master/chrome/data/data.json
site_urls <- fromJSON("bs_news_urls.json")

# replace null values with generic "bs"
site_urls$type[site_urls$type == ""] <- "bs"

# get rid of duplicates retaining last "type" label 
#(BS Detector may have fixed this issue)
site_urls <- site_urls[!rev(duplicated(rev(site_urls$url))), ]

##############################################################################

##############################################################################
# Get the data
##############################################################################

# initialize
tmp <- tempfile()
news_data <- data.frame()
i <- 0

# Token from webhose.io
TOKEN <- "TOKEN"

# loop through urls and get data from past 30 days (&ts=1477505007607)
# will get a maximum of 100 posts per site
for (url in site_urls$url) {
	
	i <- i + 1
	
	# download the data
	get_url <- paste0("https://webhose.io/search?token=",
					  TOKEN,"&format=json&q=site%3A",url,
					  "&ts=1477505007607")
	curl_download(get_url, tmp)
	tmp <- readLines(tmp)
	tmp <- fromJSON(tmp)
	
	# arrange the data in a data.frame
	if (length(tmp$posts) > 0) { # some sites aren't archived by webhose.io
		tmp_df <- tmp$posts %>%
				  select(uuid, url, ord_in_thread, author, published,
						 title, text, language, crawled)
		tmp_df$site_url <- url # add original URL as a variable
		tmp_df$country <- tmp$posts$thread$country
		tmp_df$domain_rank <- tmp$posts$thread$domain_rank
		tmp_df$thread_title <- tmp$posts$thread$title
		tmp_df$spam_score <- tmp$posts$thread$spam_score
		tmp_df$main_img_url <- tmp$posts$thread$main_image
		tmp_df$replies_count <- tmp$posts$thread$replies_count
		tmp_df$participants_count <- tmp$posts$thread$participants_count
		tmp_df <- bind_cols(tmp_df, tmp$posts$thread$social$facebook)
		
		# append new data
		news_data <- bind_rows(news_data, tmp_df)
	
	} else {
		print(paste0(i, ". Cant't find website data from `", 
					 url, "` ... Skipping."))
	}

	tmp <- tempfile()
}

##############################################################################

##############################################################################
# Clean up and write to file
##############################################################################

# match up website type to website URL
news_data_final <- left_join(news_data, site_urls, 
							 by = c("site_url" = "url")) %>%
				   select(-url)

# write to file
write.csv(news_data_final, "fake.csv", row.names=F, na="")

##############################################################################
