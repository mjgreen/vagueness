rtdataplot1 = summarySEwithin2(rtdata,  measurevar="logrt",  withinvars=c("Vgn","Gap"), idvar="subject")
erdataplot1 <- summarySEwithin2(erdata, measurevar="error", withinvars=c("Vgn","Gap"), idvar="subject")
rtdataplot1$metric = 'Response time (log ms)'
erdataplot1$metric = 'Error rate (proportion)'
rtdataplot1$score=rtdataplot1$logrt;rtdataplot1$logrt=NULL
erdataplot1$score=erdataplot1$error;erdataplot1$error=NULL
rtdataplot1$normed=rtdataplot1$logrtNormed;rtdataplot1$logrtNormed=NULL
erdataplot1$normed=erdataplot1$errorNormed;erdataplot1$errorNormed=NULL
combined=rbind(rtdataplot1,erdataplot1)
combined$metric=as.factor(combined$metric)
combined$metric=relevel(combined$metric, ref='Response time (log ms)')
combinedplote1 = ggplot(data=combined, aes(y=normed, x=Gap, group=Vgn, fill=Vgn)) +
  xlab("Numerical distance") + ylab(NULL) +
  geom_line() +
  geom_errorbar(width=.1, lty=1, col=1, aes(ymin=normed-ci, ymax=normed+ci)) +
  geom_point(size=3, col=1, aes(shape=Vgn))+
  facet_wrap(~metric, scales="free_y") +
  scale_fill_grey(name="Vagueness", start=0, end=1) +
  scale_shape_manual(name="Vagueness", values=c(21,22)) +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
        legend.key = element_blank(),
        strip.text.x = element_text(size = 18),
        aspect.ratio=1)
combinedplote1
