# lytedev-hugo-theme

> The Hugo theme for my personal site at https://lytedev.io

## Building the Theme

Due to the odd requirements I have for my personal site, there is a surprisingly
flexible build system for what seems to be a very simple website. Regardless, to
use this theme, you will need to build the actual theme files that Hugo can grok
before the theme can actually be used with Hugo.

``` sh
yarn # or `npm install`
yarn run build # or `npm run build`
```

If you're modifying the theme and would like some reload-as-you-dev goodness,
just do `yarn run dev` instead.

## Using with Hugo

Add the theme as a git submodule to your Hugo site:

``` sh
git submodule add https://github.com/lytedev/lytedev-hugo-theme themes/lytedev
```

Then build the theme (see above).

Finally, edit your Hugo config to use the theme:

``` yaml
theme: "lytedev"
```
