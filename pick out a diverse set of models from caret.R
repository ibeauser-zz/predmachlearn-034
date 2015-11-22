## code from here: http://topepo.github.io/caret/similarity.html
tag <- read.csv("tag_data.csv", row.names = 1)
tag <- as.matrix(tag)
## Select only models for ("Dual Use", "Classification", "Regression")
models <- tag[tag[,"Classification"] == 1,]
all <- 1:nrow(models)
## Seed the analysis with a model from models of chosen use. "rf" used as example.
start <- grep("(rf)", rownames(models), fixed = TRUE)
pool <- all[all != start]
## Select 4 model models by maximizing the Jaccard
## dissimilarity between sets of models
nextMods <- maxDissim(models[start,,drop = FALSE], models[pool, ], method = "Jaccard", n = 4)
print(rownames(models)[c(start, nextMods)])
