setwd("C:/Users/saraa/Desktop")
mydata <- read.csv("refine_original.csv") #0: Load data in RStudio
mydata$company <- tolower(mydata$company) #1: Clean up brand names
unique(mydata$company)

mydata$company <- gsub("phillips|philips|phllips|phillps|fillips|phlips", "phillips", mydata$company)
mydata$company <- gsub("akz0|ak zo", "akzo", mydata$company)
mydata$company <- gsub("unilver", "unilever", mydata$company)

#2: Separate product code and number
mydata$product_code <- substring(mydata$Product.code...number.,1,1)
mydata$product_number <- substring(mydata$Product.code...number.,3)

#Create 'product_category' column to exactly replicate 'product_code'
mydata$product_category <- mydata$product_code

#3: Add product categories
mydata$product_category <- sub(pattern="p",replacement = "smartphone", mydata$product_category)
mydata$product_category <- sub(pattern="v",replacement = "tv", mydata$product_category)
mydata$product_category <- sub(pattern="x",replacement = "laptop", mydata$product_category)
mydata$product_category <- sub(pattern="q",replacement = "tablet", mydata$product_category)

#4: Add full address for geocoding.
mydata$full_address <- paste(mydata$address,mydata$city,mydata$country, sep = ",")

#5: Create dummy variables for company and product category.
mydata$company_phillips <- ifelse(mydata$company== 'phillips',1,0)
mydata$company_akzo <- ifelse(mydata$company== 'akzo',1,0)
mydata$company_unilever <- ifelse(mydata$company== 'unilever',1,0)
mydata$company_vanhouten <- ifelse(mydata$company== 'van houten',1,0)
mydata$product_smartphone <- ifelse(mydata$product_category== 'smartphone',1,0)
mydata$product_tv <- ifelse(mydata$product_category== 'tv',1,0)
mydata$product_laptop <- ifelse(mydata$product_category== 'laptop',1,0)
mydata$product_tablet <- ifelse(mydata$product_category== 'tablet',1,0)

#Export refined data.
write.csv(mydata, "refine_clean.csv")

