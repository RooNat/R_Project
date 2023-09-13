---
tags: R
Week: 1
type: assignment
---

```dataview
list from #R 
where Week=1 and type="assignment"
```
## Create a data frame in R Scripts
**Step 0.** Remove all objects in the working environment
**Step 1.** `Go to File –> New File –> R Script` to create your script. Save the file by clicking File –> Save and giving the file a name of your choice eg. “`myFirstRScript`”. 
**Step 2.** Now you can start writing codes in the script. Create a data frame `animals_df`. 

```r
animals<-c("Snake","Bird","Dog","Spider")
animals
num_legs<-c(0,2,4,8)
num_legs
animals_df<-data.frame(animals,num_legs)
animals_df
```

**Step 3.** You can run all the code within your script by clicking on the “Source” button on the top right. 
**Step 4.** Get a list of objects in the working environment. 

```r
ls() #returns a vector of character strings giving the names of the objects in the environment.
#返回环境内的所有变量
rm(num_legs)
rm(list=ls())
```

## Writing a function within R
First, create an R script, and saving it using the name `mySecondRScript`.
Look at the sample function called `is_prime` for function definition and control flow statements.

```r
is_prime <- function(num){ # This example function takes as input a positive integer and outputs Boolean
stopifnot(is.numeric(num),num%%1==0,num>=0) # Stop if the input is not a non-negative integer 
t_val <- TRUE # Initialise truth value output with TRUE 
if(num<2){ 
	t_val<-FALSE # Output FALSE if input is either 0 or 1 
}else if(num>2){ 
	for(i in 2:sqrt(num)){ # Check possible divisors i no greater than sqrt(num) 
		if(num%%i==0){ 
			t_val<-FALSE 
			break # if i divides num then num is not prime 
		} 
	} 
} 
return(t_val) # return the truth value which says whether or not num is prime 
}
```
### Create a function in R
**Step 1.** Within your script create a short function called `myFirstRFunc` which takes in a single numerical argument n and outputs the sum of all those numbers strictly below n which are divisible by either 2 or 7 or both. 
	For example, if `n = 14` then it should be the sum of 2, 4, 6, 7, 8, 10, 12, so `myFirstRFunc` applied to 14 gives the answer 2 + 4 + 6 + 7 + 8 + 10 + 12 = 49. 
	Make sure your function includes useful comments. You may want to include a check so that your function produces an error if it is given an argument which isn’t a non-negative integer. 

**Step 2.** Run the script by clicking on the “Source” button on the top right. Then check what you get if you apply the function to 1000, i.e., `myFirstRFunc(1000)`

```r
myFirstRFunc<-function(n){
  sum<-0
  for(i in 1:(n-1)){
    if(i%%2==0 | i%%7==0){
      sum<-sum+i
    }
  }
  return(sum)
}

myFirstRFunc(1000)
```

```
[1] 284787
```

## Create a data frame in R Markdown
Let’s create an R markdown with html output as follows: 
`File -> New File -> R Markdown ...`
You can then choose: 
- A title for your document; 
- An author name (your name); 
- An output format. Let’s choose HTML.
Then click “OK” to create an R markdown. This will create a template project. Explore the project and note its key features:
	1. There is a block of **YAML** at the start of the document which gives key information eg. title and output format. 
	2. You can create **headings of sections** with “#”. Similarly, headings of subsections can be created with “##” and so on. 
	3. You can embed blocks of R code by using \`\`\` {r} before the R code and \`\`\` afterwards. 
	4. By default both the code and its output are displayed. If you only want to include the output but not the code itself include the option `echo = FALSE` in the code prefix. If you don’t want to include either then include the option `include = FALSE`. 
	5. You can include hyperlinks by writing `<url-name>`.
Save your R markdown file as “MyFirstRMarkdown”. Remove everything in your R markdown except for the YAML section at the top with the title, author, date, and output. Then do the following steps.

**Step 1.** Insert a block of R code. In this block of code, create a data frame animals df, using the same code you did in Question 1. In R Markdown, a block of code starts with \`\`\` {r} and ends with \`\`\`
**Step 2.** Insert another block of code to print `animals_df`. 
**Step 3.** You can then generate an HTML file with the “Knit” button just above your scripting window. Check what you have in the HTML file.

## Version control with RStudio and git
Next we will combine RStudio with git to create an R project with version control.
#### Connect RStudio to git
If you do not yet have a GitHub account sign up for one here https://github.com/. 
Next, connect your RStudio to git via the `usethis` R package. Within RStudio perform the following steps within your R console:

```r
install.packages("usethis") # Install the "usethis" R package
library(usethis) # Load the "usethis" R library
use_git_config(user.name = "Bob Smith", user.email = "bob@example.org") # Set profile info
```
The first step installs the `usethis` R package. The second step loads the `usethis` R library. You may be prompted to install RTools at this stage. If so follow the links provided by RStudio. The third step sets your git profile information. The user name you enter should be the same as the username you used to set up your git profile. Similarly, the email needs to be the same email address as you used to set up your git profile.

### Create an R project with version control
1. **Create a project on GitHub.** Go to https://github.com/ within your web browser and log into your git account. Create a new repository by clicking the green “New” button. Next:
	1. Give your repository a name eg. “firstRProject”. 
	2. Give your repository a description eg. “This is a repo for an R project”. 
	3. Check the box which says “Add a README file”. 
	4. Always be mindful of whether your repo is public or private.
	5. Click the green “Create repository” button.
	You have now created a git repository. Next click the green “Code” button and copy the url provided. This is the repository url.
2. **Create a project at RStudio.** Go back to RStudio. Then go to:
	`File -> New Project... -> Version Control -> Git` 
	* Below “Repository URL:” Paste the repository url which you copied from your git repo. 
	* Below “Project directory name:” Choose a directory name. 
	* Below “Create project as a subdirectory of:” Choose where to store your project on your local machine. 
	* Check the box marked “Open in new session”. 
	* Click create project. 
	You have now created an R project with version control!
### Committing and pushing
Within your new project click 
`File -> New File -> R Script` 
Type some R code in your new R script e.g. 
`a<-1` 
Now save your new file by selecting `File − > Save` before giving a name.
**commit.** Next go to the git tab at the top right of your screen. Then click the “commit” button. 

On the left you will see a collection of check boxes. Here you can choose which files you want to add to your git repo. I suggest for now you check all of the files.

Write a commit message in the “Commit message” box eg. “This is my first commit”. It’s good practice to always include a commit message. Click the commit button. You should see a message which describes your changes. Commits act as a “snapshot” which records the current state of your repository.

**push.** You have now taken a local “snapshot” of your repository by performing a “commit”. Next you want to record this snapshot on the central repository. This is done by performing a “Push”. All you have to do is press the green “Push” button within the git panel in RStudio. You may be asked to enter your password. You typically only have to do this once.

Now check that your push has been successful. Go back to https://github.com/ and log into your account if you are not already logged in. Go to the repositories section and click on the name of the repository you created in the previous stage of this assignment. You should see a record of your most recent commit.

Additionally, you may want to move your previous R script entitled “myFirstRScript” into this project. You can then “commit” and “push” to upload your script to your git account.