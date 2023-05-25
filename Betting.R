recent <- left_join(RecentBattedBall, FanGraphs_Leaderboard_2_, by = c("playerid", "Season"))
older <- left_join(OlderBattedBall, OlderHits, by = c("playerid", "Season"))
# Combined Fangraph tables to start

> older <- older %>% mutate(PullPerc = as.numeric(sub("%","",`Pull%`)))
> View(older)
> cor(older$H,older$PullPerc)
[1] -0.2643243
> cor(older$BABIP,older$PullPerc)
[1] -0.4039413
> recent <- recent %>% mutate(PullPerc = as.numeric(sub("%","",`Pull%`)))
> cor(recent$H, recent$PullPerc)
[1] -0.1644373
> cor(recent$BABIP, recent$PullPerc)
[1] -0.4224228
#ran a couple correlations ... not showing much so far

#Should try indexing soft vs. hard% to find if those correlations to hits changed

recent <- recent %>% mutate(SoftPerc = as.numeric(sub("%","",`Soft%`)))
recent <- recent %>% mutate(HardPerc = as.numeric(sub("%","",`Hard%`)))
recent <- recent %>% mutate(SOFT = SoftPerc/HardPerc)

older <- older %>% mutate(SoftPerc = as.numeric(sub("%","",`Soft%`)))
older <- older %>% mutate(HardPerc = as.numeric(sub("%","",`Hard%`)))
older <- older %>% mutate(SOFT = SoftPerc/HardPerc)cor