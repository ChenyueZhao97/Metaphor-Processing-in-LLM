library(tidyverse)

# Read stim_results
df <- read.csv("/Users/cyz_08/Desktop/University of Delaware /Spring 2024/LIN 800 M/Final Project /Data file/stim_results.csv") 

# Filter the target words
target.words <- c(" straw"," sword", " rainbow", " cr", " w", "arts",  " time", " oven", " jun", " hurdles", " fort", " fortress"," portraits", " blue",  " skysc", " closet", " snakes", " dag", " jails", " sharks", " fire", " kids", " rockets", " bulldo", " ser", " flying", " pawn", " z", " sculpt", " umb", " dinosaurs", " gor", " curtains", " journey", " heart", " passport", " disease", " movies", " stair", " tree", " raft", " money", " buzz", " glass", " infection", " river", " joke", " dream", " drug", " flower", " ocean", " island", " lion", " sponge", " computers", " medicine", " shack", " bo", " volcano", " candy", " thief", " glue")
target.words.df <- df |> filter(token %in% target.words)

# Plot the results 
ggplot(target.words.df, aes(x = sentence_type, y = surprisal, fill = spillover_position)) + geom_boxplot()

# Change the names of the axis
ggplot(target.words.df, aes(x = sentence_type, y = surprisal, fill = spillover_position)) + 
  geom_boxplot() +
  labs(x = "Sentence type", y = "Surprisal score")

# Median surprisal value
median_surprisal <- median(target.words.df$surprisal, na.rm = TRUE)

# Filter for metaphor and simile for both spillover conditions
metaphor_before <- target.words.df %>%
  filter(sentence_type == "metaphor" & spillover_position == "spillover before")

metaphor_after <- target.words.df %>%
  filter(sentence_type == "metaphor" & spillover_position == "spillover after")

simile_before <- target.words.df %>%
  filter(sentence_type == "simile" & spillover_position == "spillover before")

simile_after <- target.words.df %>%
  filter(sentence_type == "simile" & spillover_position == "spillover after")

# The median surprisal values
median_metaphor_before <- median(metaphor_before$surprisal, na.rm = TRUE)
median_metaphor_after <- median(metaphor_after$surprisal, na.rm = TRUE)
median_simile_before <- median(simile_before$surprisal, na.rm = TRUE)
median_simile_after <- median(simile_after$surprisal, na.rm = TRUE)

# Print median surprisal values
print(paste("Median surprisal for metaphor before spillover:", median_metaphor_before))
print(paste("Median surprisal for metaphor after spillover:", median_metaphor_after))
print(paste("Median surprisal for simile before spillover:", median_simile_before))
print(paste("Median surprisal for simile after spillover:", median_simile_after))



