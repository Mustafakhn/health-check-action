This action health checks the website given by the user

HOW TO USE

```
uses: Mustafakhn/health-check-action@main
      with:
          website_url: <url_for_website>
          version_name: <version_name> #optional
          method: wget #optional
```

It has three inputs :-

- website_url: (required)

- version name: (optional) you can check a version if you have any thing that is version specific embedded in the root html file

- method: (optional) you can give the method you want to use to check the website the options are (curl and wget) default is curl

This action has a timeout of 5 minutes

This action will try to reach the given website for 5 minutes

If your website isn't up then it will fail after 5 minutes and return the ( failure ) status if it times out else it will return ( success ) status if it's able to reach the given website
