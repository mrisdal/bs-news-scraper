## Overview

This repository contains documentation for the [Getting Real about Fake News][12] dataset published on Kaggle.

## Dataset Description

The latest hot topic in the news is fake news and many are wondering what data scientists can do to detect it and stymie its viral spread. This dataset is only a first step in understanding and tackling this problem. It contains text and metadata scraped from 244 [websites tagged as "bullshit" here][1] by the [BS Detector][2] Chrome Extension by [Daniel Sieradski][3]. 

**Warning**: I did not modify the list of news sources from the BS Detector so as not to introduce my (useless) layer of bias; I'm not an authority on fake news. There may be sources whose inclusion you disagree with. It's up to you to decide how to work with the data and how you might contribute to "improving it". The labels of "bs" and "junksci", etc. do not constitute capital "t" Truth. If there are other sources you would like to include, start a discussion. If there are sources you believe should not be included, start a discussion or write a kernel analyzing the data. Or take the data and do something else productive with it. Kaggle's choice to host this dataset is not meant to express any particular political affiliation or intent.

## Contents

The dataset contains text and metadata from 244 websites and represents 12,999 posts in total from the past 30 days. The data was pulled using the [webhose.io][4] API; because it's coming from their crawler, not all websites identified by the BS Detector are present in this dataset. Each website was labeled according to the [BS Detector as documented here][5]. Data sources that were missing a label were simply assigned a label of "bs". There are (ostensibly) no genuine, reliable, or trustworthy news sources represented in this dataset (so far), so don't trust anything you read.

## Fake news in the news

For inspiration, I've included some (presumably non-fake) recent stories covering fake news in the news. This is a sensitive, nuanced topic and if there are other resources you'd like to see included here, please leave a suggestion. From defining fake, biased, and misleading news in the first place to deciding how to take action (a blacklist is not a good answer), there's a lot of information to consider beyond what can be neatly arranged in a CSV file.

* [How Fake News Spreads (NYT)][6]

* [We Tracked Down A Fake-News Creator In The Suburbs. Here's What We Learned (NPR)][7]

* [Does Facebook Generate Over Half of its Revenue from Fake News? (Forbes)][8]

* [Fake News is Not the Only Problem (Points - Medium)][9]

## Improvements

If you have suggestions for improvements or would like to contribute, please let me know. The most obvious extension is to include data from "real" news sites. Even a list of authentic news sources would be helpful to the project. I'd be happy to include any contributions in future versions of the dataset.

## Acknowledgements

Thanks to [Anthony][10] for pointing me to [Daniel Sieradski's BS Detector][11]. Thank you to Daniel Nouri for encouraging me to add a disclaimer to the dataset's page.


  [1]: https://github.com/selfagency/bs-detector/blob/master/chrome/data/data.json
  [2]: https://github.com/selfagency/bs-detector
  [3]: https://github.com/selfagency
  [4]: https://webhose.io/api
  [5]: https://github.com/selfagency/bs-detector/blob/master/chrome/data/data.json
  [6]: http://www.nytimes.com/2016/11/20/business/media/how-fake-news-spreads.html
  [7]: http://www.npr.org/sections/alltechconsidered/2016/11/23/503146770/npr-finds-the-head-of-a-covert-fake-news-operation-in-the-suburbs
  [8]: http://www.forbes.com/forbes/welcome/?toURL=http://www.forbes.com/sites/petercohan/2016/11/25/does-facebook-generate-over-half-its-revenue-from-fake-news
  [9]: https://points.datasociety.net/fake-news-is-not-the-problem-f00ec8cdfcb#.577yk6s8a
  [10]: https://www.kaggle.com/antgoldbloom
  [11]: https://github.com/selfagency/bs-detector
  [12]: https://www.kaggle.com/mrisdal/fake-news