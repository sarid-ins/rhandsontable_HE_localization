# The app is a small demo/reprex for localization practice - fitting the CSS code to make the handsontable localized


library(shiny)
library(rhandsontable)
library(tidyverse)

data_to_render <- read_csv("example_table.csv",
                           col_types = "ccfcclfcD")


ui <- fluidPage(
    tags$head(tags$link(rel = "stylesheet", href = "bootstrap-rtl.css")),
    fluidRow(h1(
        "הטבלה הבאה מבוססת על handsontable - ספריית javascript"
    )),
    fluidRow(rHandsontableOutput("the_table")),
    fluidRow(br(),
             h2("להלן באגים בטבלה:"),
             HTML(
                 '
                 <p style="text-align: right;">נכון למועד זה, העיצוב מבוסס על bootstrap-rtl.css (הסיבה שאני לוקח קובץ מלא שכולל עיצובים לעוד הרבה רכיבים שאינם בדוגמה זו, היא שבמציאות יש לי הרבה רכיבים נוספים, רוצה שמראש תביא זאת בחשבון). להלן מספר בעיות שאני איתרתי בטבלה.</p>
                 <p style="text-align: right;">בשדה בחירה (לדוגמה "תפקיד"): החץ בחירה נמצא בצד ימין של התא במקום בצד שמאל. כאשר לוחצים על בחירה, לא רואים את הגלגלת (scroll bar) שמאפשרת לגלול בין אפשרויות הבחירה. ניתן לגלול עם החצים או עם הגלגלת של העכבר. כמו כן, לפעמים נפתחת רשימה חלקית במקום הרשימה המלאה (לרשימה המלאה 4 ערכים).</p>
                 <p style="text-align: right;">כנ"ל בשדה בחירה "שפה" החץ בחירה נמצא מצד ימין.</p>
                 <p style="text-align: right;">כאשר נמצאים על תא מסוים (באמצע הטבלה), לחיצה על החץ ימינה מובילה שמאלה, ולהיפך, לחיצה על החץ שמאלה מובילה ימינה (זה אמור לעבוד ככה באנגלית, אבל בעברית אמור להיות הפוך). יש לי הרגשה שזה עניין של JS ולא CSS...?</p>
                 <p style="text-align: right;">בדוגמאות המתועדות בקישור המצ"ב מטה, כאשר לוחצים על תא מסוים בטבלה, יש מסגרת כחולה המקיפה אותו (בדומה למסגרת המופיעה בExcel כאשר עומדים על תא מסוים). בטבלה שלנו, המסגרת אינה מופיעה.</p>
                 <p style="text-align: right;">יש עוד באג בטבלאות ארוכות במיוחד, כאשר הטבלה חורגת מהמסך ולעמוד מתווסף Scroll bar - אז שימוש בגלגלת של העכבר כאשר העכבר נמצא מעל הטבלה, אינו משפיע. זה כאילו הוא מנסה "לגלגל" את אובייקט הטבלה במקום לבצע את ה"גלגול" על העמוד. (מקווה שהצלחתי להסביר, אם לא, אוכל להסביר טלפונית).</p>
                 <p style="direction: rtl;">תיעוד של איך הטבלה אמורה להיראות (באנגלית) נמצא בקישור הבא (יש שם הרבה דוגמאות יכול להיות שיקח זמן לטעון):</p>
                 <p style="direction: rtl;"><a href="https://cran.r-project.org/web/packages/rhandsontable/vignettes/intro_rhandsontable.html">https://cran.r-project.org/web/packages/rhandsontable/vignettes/intro_rhandsontable.html</a></p>
                 <p style="direction: rtl;">&nbsp;</p>
                 '
             ))
    
    
)

server <- function(input, output) {
    
    output$the_table <- renderRHandsontable({
        
        rhandsontable(data_to_render, 
                      useTypes = TRUE,
                      highlightCol = TRUE,
                      highlightRow = TRUE,
                      contextMenu = FALSE)
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
