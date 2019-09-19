(* ::Package:: *)

clc,clear
ab0=load('data111.txt');   % \:539f\:59cb\:6570\:636e\:5b58\:653e\:5728\:7eaf\:6587\:672c\:6587\:4ef6data111.txt\:4e2d
mu=mean(ab0);sig=std(ab0); % \:6c42\:5747\:503c\:548c\:6807\:51c6\:5dee
ab=zscore(ab0); % \:6570\:636e\:6807\:51c6\:5316
a=ab(:,[1:end-1]);b=ab(:,end);  % \:63d0\:51fa\:6807\:51c6\:5316\:540e\:7684\:81ea\:53d8\:91cf\:548c\:56e0\:53d8\:91cf\:6570\:636e
[XL,YL,XS,YS,BETA,PCTVAR,MSE,stats] =plsregress(a,b)
xw=a\XS  % \:6c42\:81ea\:53d8\:91cf\:7684\:4e3b\:6210\:5206\:7cfb\:6570\:ff0c\:6bcf\:5217\:5bf9\:5e94\:4e00\:4e2a\:6210\:5206\:ff0c\:8fd9\:91ccxw\:7b49\:4e8estats.W
yw=b\YS  % \:6c42\:56e0\:53d8\:91cf\:7684\:4e3b\:6210\:5206\:7cfb\:6570
ncomp=input('\:8bf7\:6839\:636ePCTVAR\:7684\:503c\:786e\:5b9a\:63d0\:51fa\:6210\:5206\:5bf9\:7684\:4e2a\:6570ncomp=');
[XL2,YL2,XS2,YS2,BETA2,PCTVAR2,MSE2,stats2] =plsregress(a,b,ncomp)
n=size(a,2); % n\:662f\:81ea\:53d8\:91cf\:7684\:4e2a\:6570
beta3(1)=mu(end)-mu (1:n)./sig(1:n)*BETA2 ([2:end]).*sig(end); % \:539f\:59cb\:6570\:636e\:56de\:5f52\:65b9\:7a0b\:7684\:5e38\:6570\:9879
beta3([2:n+1])=(1./sig(1:n))'*sig (n+1:end).*BETA2([2:end]) 
bar(BETA2','k')   % \:753b\:76f4\:65b9\:56fe
yhat=repmat(beta3(1),[size(a,1),1])+ab0(:,[1:n])*beta3 ([2:end])'  % \:6c42y\:7684\:9884\:6d4b\:503c
ymax=max([yhat;ab0(:,end)]); % \:6c42\:9884\:6d4b\:503c\:548c\:89c2\:6d4b\:503c\:7684\:6700\:5927\:503c
figure
plot(yhat(:,1),ab0(:,n+1),'*',[0:ymax],[0:ymax],'Color','k')
legend('\:539f\:8f9b\:70f7\:503c\:9884\:6d4b\:56fe',2)
