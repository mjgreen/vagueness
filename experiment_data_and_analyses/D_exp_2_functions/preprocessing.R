preprocessing = function(root_dir, data_dir) {
  
  # The policy as of Aug 2018 is that:
  # RT=0 is stripped, and one case with a very long time RT=49871 is stripped.
  
  dat <- read.delim(file.path(root_dir, data_dir, "data_raw.txt"), stringsAsFactors = FALSE)
  
  # declare local variables
  number_of_valid_subjects <- 38
  number_of_rows <- 7296
  number_of_trials_per_subject <- number_of_rows / number_of_valid_subjects # 192
  
  # sort out borderline responses into expected near and far
  dat$RESPONSE <- as.character(dat$RESPONSE)
  for (row in 1 : nrow(dat) ) {
    switch(dat[row,'RESPONSE'],
           'LEFT' = {dat[row, 'choice'] <- dat[row, 'Left']},
           'MIDDLE' = {dat[row, 'choice'] <- dat[row, 'Mid']},
           'RIGHT' = {dat[row, 'choice'] <- dat[row, 'Right']}         
    )
  }

  dat$crossed=paste('Con',dat$Condition,':Quan',dat$Quantity,':Item',dat$Item,sep="")
  
  dat[dat$crossed=='Con1:Quan1:Item1', 'ResponseExpected'] <-  6 
  dat[dat$crossed=='Con1:Quan1:Item1', 'ResponseNear']     <- 15  
  dat[dat$crossed=='Con1:Quan1:Item1', 'ResponseFar']      <- 24
  
  dat[dat$crossed=='Con1:Quan1:Item2', 'ResponseExpected'] <- 16
  dat[dat$crossed=='Con1:Quan1:Item2', 'ResponseNear']     <- 25  
  dat[dat$crossed=='Con1:Quan1:Item2', 'ResponseFar']      <- 34
  
  dat[dat$crossed=='Con1:Quan1:Item3', 'ResponseExpected'] <- 26
  dat[dat$crossed=='Con1:Quan1:Item3', 'ResponseNear']     <- 35
  dat[dat$crossed=='Con1:Quan1:Item3', 'ResponseFar']      <- 44
  
  dat[dat$crossed=='Con1:Quan1:Item4', 'ResponseExpected'] <- 36
  dat[dat$crossed=='Con1:Quan1:Item4', 'ResponseNear']     <- 45
  dat[dat$crossed=='Con1:Quan1:Item4', 'ResponseFar']      <- 54
  
  dat[dat$crossed=='Con1:Quan2:Item1', 'ResponseExpected'] <- 24
  dat[dat$crossed=='Con1:Quan2:Item1', 'ResponseNear']     <- 15 
  dat[dat$crossed=='Con1:Quan2:Item1', 'ResponseFar']      <-  6
  
  dat[dat$crossed=='Con1:Quan2:Item2', 'ResponseExpected'] <- 34
  dat[dat$crossed=='Con1:Quan2:Item2', 'ResponseNear']     <- 25  
  dat[dat$crossed=='Con1:Quan2:Item2', 'ResponseFar']      <- 16
  
  dat[dat$crossed=='Con1:Quan2:Item3', 'ResponseExpected'] <- 44
  dat[dat$crossed=='Con1:Quan2:Item3', 'ResponseNear']     <- 35
  dat[dat$crossed=='Con1:Quan2:Item3', 'ResponseFar']      <- 26
  
  dat[dat$crossed=='Con1:Quan2:Item4', 'ResponseExpected'] <- 54
  dat[dat$crossed=='Con1:Quan2:Item4', 'ResponseNear']     <- 45
  dat[dat$crossed=='Con1:Quan2:Item4', 'ResponseFar']      <- 36
  
  dat[dat$crossed=='Con2:Quan1:Item1', 'ResponseExpected'] <-  6 
  dat[dat$crossed=='Con2:Quan1:Item1', 'ResponseNear']     <- 15  
  dat[dat$crossed=='Con2:Quan1:Item1', 'ResponseFar']      <- 24
  
  dat[dat$crossed=='Con2:Quan1:Item2', 'ResponseExpected'] <- 16
  dat[dat$crossed=='Con2:Quan1:Item2', 'ResponseNear']     <- 25  
  dat[dat$crossed=='Con2:Quan1:Item2', 'ResponseFar']      <- 34
  
  dat[dat$crossed=='Con2:Quan1:Item3', 'ResponseExpected'] <- 26
  dat[dat$crossed=='Con2:Quan1:Item3', 'ResponseNear']     <- 35
  dat[dat$crossed=='Con2:Quan1:Item3', 'ResponseFar']      <- 44
  
  dat[dat$crossed=='Con2:Quan1:Item4', 'ResponseExpected'] <- 36
  dat[dat$crossed=='Con2:Quan1:Item4', 'ResponseNear']     <- 45
  dat[dat$crossed=='Con2:Quan1:Item4', 'ResponseFar']      <- 54
  
  dat[dat$crossed=='Con2:Quan2:Item1', 'ResponseExpected'] <- 24
  dat[dat$crossed=='Con2:Quan2:Item1', 'ResponseNear']     <- 15 
  dat[dat$crossed=='Con2:Quan2:Item1', 'ResponseFar']      <-  6
  
  dat[dat$crossed=='Con2:Quan2:Item2', 'ResponseExpected'] <- 34
  dat[dat$crossed=='Con2:Quan2:Item2', 'ResponseNear']     <- 25  
  dat[dat$crossed=='Con2:Quan2:Item2', 'ResponseFar']      <- 16
  
  dat[dat$crossed=='Con2:Quan2:Item3', 'ResponseExpected'] <- 44
  dat[dat$crossed=='Con2:Quan2:Item3', 'ResponseNear']     <- 35
  dat[dat$crossed=='Con2:Quan2:Item3', 'ResponseFar']      <- 26
  
  dat[dat$crossed=='Con2:Quan2:Item4', 'ResponseExpected'] <- 54
  dat[dat$crossed=='Con2:Quan2:Item4', 'ResponseNear']     <- 45
  dat[dat$crossed=='Con2:Quan2:Item4', 'ResponseFar']      <- 36
  
  dat[dat$crossed=='Con3:Quan1:Item1', 'ResponseExpected'] <-  6 
  dat[dat$crossed=='Con3:Quan1:Item1', 'ResponseNear']     <- 15  
  dat[dat$crossed=='Con3:Quan1:Item1', 'ResponseFar']      <- 24
  
  dat[dat$crossed=='Con3:Quan1:Item2', 'ResponseExpected'] <- 16
  dat[dat$crossed=='Con3:Quan1:Item2', 'ResponseNear']     <- 25  
  dat[dat$crossed=='Con3:Quan1:Item2', 'ResponseFar']      <- 34
  
  dat[dat$crossed=='Con3:Quan1:Item3', 'ResponseExpected'] <- 26
  dat[dat$crossed=='Con3:Quan1:Item3', 'ResponseNear']     <- 35
  dat[dat$crossed=='Con3:Quan1:Item3', 'ResponseFar']      <- 44
  
  dat[dat$crossed=='Con3:Quan1:Item4', 'ResponseExpected'] <- 36
  dat[dat$crossed=='Con3:Quan1:Item4', 'ResponseNear']     <- 45
  dat[dat$crossed=='Con3:Quan1:Item4', 'ResponseFar']      <- 54
  
  dat[dat$crossed=='Con3:Quan2:Item1', 'ResponseExpected'] <- 24
  dat[dat$crossed=='Con3:Quan2:Item1', 'ResponseNear']     <- 15 
  dat[dat$crossed=='Con3:Quan2:Item1', 'ResponseFar']      <-  6
  
  dat[dat$crossed=='Con3:Quan2:Item2', 'ResponseExpected'] <- 34
  dat[dat$crossed=='Con3:Quan2:Item2', 'ResponseNear']     <- 25  
  dat[dat$crossed=='Con3:Quan2:Item2', 'ResponseFar']      <- 16
  
  dat[dat$crossed=='Con3:Quan2:Item3', 'ResponseExpected'] <- 44
  dat[dat$crossed=='Con3:Quan2:Item3', 'ResponseNear']     <- 35
  dat[dat$crossed=='Con3:Quan2:Item3', 'ResponseFar']      <- 26
  
  dat[dat$crossed=='Con3:Quan2:Item4', 'ResponseExpected'] <- 54
  dat[dat$crossed=='Con3:Quan2:Item4', 'ResponseNear']     <- 45
  dat[dat$crossed=='Con3:Quan2:Item4', 'ResponseFar']      <- 36
  
  dat[dat$crossed=='Con4:Quan1:Item1', 'ResponseExpected'] <-  6 
  dat[dat$crossed=='Con4:Quan1:Item1', 'ResponseNear']     <- 15  
  dat[dat$crossed=='Con4:Quan1:Item1', 'ResponseFar']      <- 24
  
  dat[dat$crossed=='Con4:Quan1:Item2', 'ResponseExpected'] <- 16
  dat[dat$crossed=='Con4:Quan1:Item2', 'ResponseNear']     <- 25  
  dat[dat$crossed=='Con4:Quan1:Item2', 'ResponseFar']      <- 34
  
  dat[dat$crossed=='Con4:Quan1:Item3', 'ResponseExpected'] <- 26
  dat[dat$crossed=='Con4:Quan1:Item3', 'ResponseNear']     <- 35
  dat[dat$crossed=='Con4:Quan1:Item3', 'ResponseFar']      <- 44
  
  dat[dat$crossed=='Con4:Quan1:Item4', 'ResponseExpected'] <- 36
  dat[dat$crossed=='Con4:Quan1:Item4', 'ResponseNear']     <- 45
  dat[dat$crossed=='Con4:Quan1:Item4', 'ResponseFar']      <- 54
  
  dat[dat$crossed=='Con4:Quan2:Item1', 'ResponseExpected'] <- 24
  dat[dat$crossed=='Con4:Quan2:Item1', 'ResponseNear']     <- 15 
  dat[dat$crossed=='Con4:Quan2:Item1', 'ResponseFar']      <-  6
  
  dat[dat$crossed=='Con4:Quan2:Item2', 'ResponseExpected'] <- 34
  dat[dat$crossed=='Con4:Quan2:Item2', 'ResponseNear']     <- 25  
  dat[dat$crossed=='Con4:Quan2:Item2', 'ResponseFar']      <- 16
  
  dat[dat$crossed=='Con4:Quan2:Item3', 'ResponseExpected'] <- 44
  dat[dat$crossed=='Con4:Quan2:Item3', 'ResponseNear']     <- 35
  dat[dat$crossed=='Con4:Quan2:Item3', 'ResponseFar']      <- 26
  
  dat[dat$crossed=='Con4:Quan2:Item4', 'ResponseExpected'] <- 54
  dat[dat$crossed=='Con4:Quan2:Item4', 'ResponseNear']     <- 45
  dat[dat$crossed=='Con4:Quan2:Item4', 'ResponseFar']      <- 36
  
  dat$isResponseExpected <- dat$choice == dat$ResponseExpected
  dat$isResponseNear <- dat$choice ==     dat$ResponseNear
  dat$isResponseFar <- dat$choice ==      dat$ResponseFar
  
  for ( row in 1:nrow(dat) ) {
    dat[row, 'response_cat'] <- 
      ifelse(dat[row, 'isResponseExpected']==TRUE, 'Expected', 
             ifelse(dat[row, 'isResponseNear']==TRUE, 'Near', 'Far') ) 
  }
  
  # ensure Subject is a factor 
  dat$Subject=factor(paste("s",sprintf("%02d",dat$Subject),sep=""))
  
  # Trial for subject, 1 to 192
  dat$Trial = rep(x = 1:number_of_trials_per_subject, times = number_of_valid_subjects)
  
  # id is a unique identifier for the 7296 row data
  dat$Obs <- 1:number_of_rows
  
  # make Item be a factor and assign labels
  dat$Item <- factor(dat$Item, levels=c(1,2,3,4), labels=c("06:15:24", "16:25:34", "26:35:44", "36:45:54"))
  
  # Create a factor coding for Vagueness
  dat[ dat$Condition==1 , 'Vagueness'] <- 'Vague'
  dat[ dat$Condition==2 , 'Vagueness'] <- 'Crisp'
  dat[ dat$Condition==3 , 'Vagueness'] <- 'Vague'
  dat[ dat$Condition==4 , 'Vagueness'] <- 'Crisp'
  dat$Vagueness <- as.factor(dat$Vagueness)
  
  # Create a factor coding for Selection
  dat$Selection = ""
  dat[dat$Condition %in% c(3,4), "Selection"] <- "Comparison"
  dat[dat$Condition %in% c(1,2), "Selection"] <- "Matching"
  dat$Condition <- NULL
  dat$Selection <- as.factor(dat$Selection)
  
  # give the levels of Order meaningful names
  dat$Order <- factor(dat$Order, levels=c(1,2), labels=c('LtoR','RtoL'))
  
  # give the levels of Quantity meaningful names
  dat$Quantity <- factor(dat$Quantity, levels=c(1,2), labels=c('Small','Large'))
  
  # add number of characters in the instruction # 29 30 34 36 38
  dat$nchar_instr = nchar(as.character(dat$Instruction))
  
  # make Instruction be a factor (17 levels)
  dat$Instruction <- as.factor(dat$Instruction) 

  # RT for the instructions screen  
  dat$rt_instr <- dat$Instruction_RT; dat$Instruction_RT <- NULL
  
  dat <- subset(dat, select=c(Subject, Item, Obs, Trial, Vagueness, Selection, Order, Quantity, Instruction, nchar_instr, RT, rt_instr, response_cat))
  return(dat)
  
}