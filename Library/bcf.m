function x=bcf(i,p,v)
% bcf= basic combination functions; this function combines all basic combination functions in one vector
global s;
if     i==1     x=eucl(p,v); 
elseif i==2     x=alogistic(p,v); 
elseif i==3     x=hebb(p,v); 
elseif i==4     x=scm(p,v); 
elseif i==5     x=slhomo(p,v); 
elseif i==6     x=sqhomo(p,v); 
elseif i==7     x=alhomo(p,v); 
elseif i==8     x=aqhomo(p,v); 
elseif i==9     x=sconnhebb(p,v); 
elseif i==10    x=srconnhebb(p,v); 
elseif i==11    x=srstateshebb(p,v); 
elseif i==12    x=sstateshebb(p,v); 
elseif i==13    x=slogistic(p,v);
elseif i==14    x=cubehomo(p,v);
elseif i==15    x=exphomo(p,v);
elseif i==16    x=log1homo(p,v);
elseif i==17    x=log2homo(p,v);
elseif i==18    x=sinhomo(p,v);
elseif i==19    x=tanhomo(p,v);
elseif i==20    x=invtan(p,v);
elseif i==21    x=id(p,v);
elseif i==22    x=complementid(p,v);
elseif i==23    x=product2(p,v);
elseif i==24    x=coproduct(p,v);
elseif i==25    x=sminimum(p,v);
elseif i==26    x=smaximum(p,v);
elseif i==27    x=aproduct(p,v);
elseif i==28    x=aminmax(p,v);
elseif i==29    x=multicriteriahomo(p,v);
elseif i==30    x=ssum(p,v);
elseif i==31    x=adnormsum(p,v);
elseif i==32    x=adnormeucl(p,v);
elseif i==33    x=sgeomean(p,v);
elseif i==34    x=s2scm(p,v);
elseif i==35    x=stepmod(p,v);  
elseif i==36    x=stepmodopp(p,v); 
elseif i==37    x=hebbneg(p,v); 
elseif i==38    x=sigmoid(p,v);
elseif i==39    x=hebbqual(p,v);
elseif i==40    x=max2and1bcfs(p,v);
elseif i==41    x=boundedgrowth(p,v);
elseif i==42    x=min_alog_composition(p,v);
elseif i==43    x=steponce(p,v);
elseif i==44    x=scalemap(p,v);
elseif i==45    x=scalemapopp(p,v);
elseif i==46    x=posdev(p,v); 
elseif i==47    x=negdev(p,v);
elseif i==48    x=steps(p,v);
elseif i==49    x=max_hebb_composition(p,v);
elseif i==50    x=maxmin2(p,v);
elseif i==51    x=maxmin3(p,v);
elseif i==52    x=randsteponce(p,v);
elseif i==53    x=randstepmod(p,v);
elseif i==54    x=compdiff(p,v);
elseif i==55    x=randstepmodopp(p,v);
elseif i==56    x=swcorrcoeff(p,v);
elseif i==57    x=randstepmodalt(p,v);
elseif i==58    x=compdiffnorm(p,v);
elseif i==59    x=swcorrcoeff0(p,v);
elseif i==60    x=compdifflag(p,v);
elseif i==61    x=compdifflag1av(p,v);
elseif i==62    x=compdifflag2av(p,v);
elseif i==63    x=swcorrcoeffsu(p,v);
elseif i==64    x=transdetav(p,v);
elseif i==65    x=transdetmaxmin(p,v);
elseif i==66    x=transdetmaxminabs(p,v);
elseif i==67    x=transdetavabs(p,v);
elseif i==68    x=transdetstdev(p,v);
elseif i==69    x=scenario_generation(p,v);
elseif i==70    x=alogisticneg(p,v);
elseif i==71    x=swsm(p,v);                    % signal matching
elseif i==72    x=swidm(p,v);                   % instantaneous derivative matching
elseif i==73    x=swcompdiffnorm(p,v);          % complementary difference normalised
elseif i==74    x=swami(p,v);                   % average mutual information
% custom combination functions
elseif i==75    x=custom_stepmod(p,v);
elseif i==76    x=custom_ssum(p,v);
elseif i==77    x=custom_neg_hebb(p,v);
end
end