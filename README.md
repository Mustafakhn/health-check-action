This action health checks the website given by the user

HOW TO USE

```
uses: Mustafakhn/health-check-action@v1
      with:
          website_url: <url_for_website>
          version_name: <version_name> #optional
          method: wget #optional - default is curl
          timeout: 600 #optional - default is 300
```

The action has four inputs :-

- website_url: (required)

- version_name: (optional) you can check a version if you have any thing that is version specific embedded in the root html file

- method: (optional) you can give the method you want to use to check the website the options are (curl and wget) default is curl

- timeout: (optional) you can give specify a time limit in seconds on which you want to run this action default is 300

This action has a default timeout of 5 minutes you can change the value while using the action

This action will try to reach the given website for the given timeout

If your website isn't up then it will fail after the given timeout attribute and return the ( failure ) status if it times out else it will return ( success ) status if it's able to reach the given website
