##########################################################################
# What´s correlated? #

# Renata Muylaert - renatamuy at gmail.com

memory.limit(size = 1.75e13)

require(corrplot)

# data

set.seed(42)

x <- sort(runif(50))
y <- sort(rnorm(50))
z <- y ^ 3
h <- rnorm(n = 50, mean = 5, sd = 10)

comunidade <- data.frame(x, y, z, h)

colnames(comunidade)

preditores <- c("x", "y", "z","h")

# Default is Kendall´s 

p.mat <- cor.mtest(comunidade[preditores])$p 

M <- cor(comunidade[preditores])

# What is not correlation is signed with a cross, considering 5% significance level
# Higher the correlation, bigger the square

png(file="corr.png", res=300, unit="cm", width= 22, height= 22)

corrplot(M, type = "upper", order = "hclust", method="square",  p.mat = p.mat, sig.level = 0.05, tl.col= "black", col = gray.colors(100))

dev.off()

##########################################################################