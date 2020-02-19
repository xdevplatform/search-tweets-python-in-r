# Running search-tweets-python in R

A code sample that walks you through how to run [Search Tweets Python](https://github.com/twitterdev/search-tweets-python) library in R using the package [reticulate](https://rstudio.github.io/reticulate/). This code was created by [Jessica Garson](https://twitter.com/jessicagarson). For this code to run you will need to set up a configuration file with your secrets, a sample of this can be found as under `secret.yaml.sample`. Rename this to `secret.yaml` and added your Twitter Keys, Bearer Token, and remember to change the environment name for your premium API URL. Read the documentation for the [Search Tweets Python](https://github.com/twitterdev/search-tweets-python) library and edit `secret.yaml` if you would like to target an enterprise subscription.

Be sure to add your `secret.yaml` to your `.gitignore` to avoid adding it to source control, and check out [our guide on securing keys and tokens](https://developer.twitter.com/en/docs/basics/authentication/guides/securing-keys-and-tokens).

This code works best in RStudio, but it will also work in the R terminal if you prefer.

## Support

Create a [new issue](https://github.com/twitterdev/search-tweets-python-in-r/issues) on GitHub.

## Contributing

We feel that a welcoming community is important and we ask that you follow Twitter's
[Open Source Code of Conduct](https://github.com/twitter/code-of-conduct/blob/master/code-of-conduct.md)
in all interactions with the community.

## License

Copyright 2020 Twitter, Inc.

Licensed under the Apache License, Version 2.0: https://www.apache.org/licenses/LICENSE-2.0
