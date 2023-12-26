download.file("http://www.datacarpentry.org/semester-biology/data/locations.zip",
              "locations.zip")
path = 'F:/r-utils/data/'
unzip(paste0(path,'locations.zip'))

data_files =list.files(path = path, pattern = "locations-")

n_files = length(data_files)

# Exercise 1: Loop over the data files and count rows and columns and store in the dataframe
results = data.frame()
for (i in 1:n_files){
  filename = data_files[1]
  data = read.csv(paste0(path, filename))
  rowCount = nrow(data)
  colCount = ncol(data)
  out = data.frame(file_name = filename,
                   rowCount = rowCount,
                   colCount = colCount)
  results = rbind(results, out)
}

#Exercise2: for loop to calculate row sums of a matrix
matrix = matrix(1:100, nrow = 100, ncol = 10)

# Initialize an empty vector to store the row sums
row_sums = vector()

#loop through each row of the matrix
for (i in 1:nrow(matrix)){
  row_sum =sum(matrix[i,])
  row_sums = c(row_sums, row_sum)
  
}
matrix = cbind(matrix, row_sums)
