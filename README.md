![](http://www.sarid-ins.com/files/site_image/logo_eng_2.png)

# handsontable RTL (Hebrew) localization

A simple shiny app for experiments with localizing rhandsontable to RTL support.

*rhandsontable* is an A htmlwidgets implementation of Handsontable.js, see:
[https://github.com/jrowen/rhandsontable](https://github.com/jrowen/rhandsontable)

The package is great, since it allows for interaction of a shiny app with the user in an "Excel-like" manner.
However, when it comes to rendering in Hebrew, with RTL, things get messed up.

The app deployed at the following link illustrate the problems I was able to identify, which are the most "pressing":
[https://sarid.shinyapps.io/rhandsontable_HE_localization/](https://sarid.shinyapps.io/rhandsontable_HE_localization/)

The issue of RTL support to the Handsontable.js library is discussed in [this issue](https://github.com/handsontable/handsontable/issues/83), however I'm not sure it is 100% resolved. For myself, I wasn't able to solve it by adding the suggested edit by @alexlehm89 (see buttom of issue) to the css file. Perhaps I added the style incorrectly or perhaps it covers only parts of the table's options.

It looks like the issue was referred to in a commit made a year ago, but I think that this commit is the PRO version while the R package uses the basic version only (not sure it can be used with the PRO version).

So the question is, **what can be done with CSS to repair the issues** seen in the [live link example](https://sarid.shinyapps.io/rhandsontable_HE_localization/).


