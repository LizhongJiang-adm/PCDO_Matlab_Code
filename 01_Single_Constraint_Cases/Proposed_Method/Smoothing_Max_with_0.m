function [sms_rlst] = Smoothing_Max_with_0(input,SmthPrmt)
%Actually function is different from version described in loxton's article,
%because inequality in problem reformulation is in the opposite direction.


%%% 版本2
alpha = SmthPrmt;

sms_rlst = 0.5*(sqrt(input.^2 + 4*alpha.^2) + input);


%%% 版本1 导数不光滑

% epislon=0.001;
% sms_rlst=zeros(1,numel(input));
% 
% 
% for i = 1:numel(input)
%     if(input(i)>epislon)
%         sms_rlst(i)=input(i);
%     end
%     
%     if(-epislon<=input(i) && input(i)<=epislon)
%         sms_rlst(i)=(input(i)+epislon)^2/(4*epislon);
%     end
% end

end



