# Install and call the packages
install.packages('reticulate')
install.packages('dplyr')

# Call packages
library('reticulate')
library('dplyr')

# Python path - must specify dot version ex 3.7
path_to_python <- "/usr/bin/python3.7"
use_python(path_to_python)


# Create the virtualenv
virtualenv_install("tweetenv", "searchtweets", ignore_installed = TRUE)
virtualenv_install("tweetenv", "pandas", ignore_installed = TRUE)
use_virtualenv("tweetenv", required = TRUE)


# Import searchtweets and yaml
st <- import("searchtweets")
pd <- import("pandas")

# Load secrets in
cred <-
  st$load_credentials(filename = "secret.yaml",
                      yaml_key = "search_tweets_api",
                      env_overwrite = FALSE)


# Getting the Twitter handle we want to work with
input <- readline('What handle do you want to get Tweets from? ')

# Working with dates
today <- toString(Sys.Date())
thirty_days <- toString(as.Date(today) - 30)

# Formatting the input to work with the rule
pt_format <- sprintf("from:%s", input)
print(pt_format)

# Get the rule
rule <-
  st$gen_rule_payload(
    pt_rule = pt_format,
    from_date = thirty_days,
    to_date = today,
    results_per_call = 500
  )

print(rule)

# Connect to the stream
rs <-
  st$ResultStream(
    rule_payload = rule,
    max_results = 500,
    username = cred$extra_headers_dict,
    endpoint = cred$endpoint,
    bearer_token = cred$bearer_token
  )

print(rs)

# Getting Tweets
tweets <- rs$stream()
print(tweets)
it_tweets <- iterate(tweets)

# Loading it into a pandas data frame
tweets_df <- pd$DataFrame(data = it_tweets)
View(tweets_df)

# Getting just IDs date and text
smaller_df <- select(tweets_df, created_at, id, text)
View(smaller_df)
