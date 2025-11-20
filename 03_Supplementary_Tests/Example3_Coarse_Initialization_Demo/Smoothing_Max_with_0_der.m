function [sms_rlst_der] = Smoothing_Max_with_0_der(input,SmthPrmt)
%Actually function is different from version described in loxton's article,
%because inequality in problem reformulation is in the opposite direction.


%%% 版本2
alpha = SmthPrmt;


sms_rlst_der = input./(2*sqrt(input.^2 + 4*alpha.^2)) + 0.5;



%%% 版本1 导数不光滑

% epislon=0.001;
% sms_rlst_der=zeros(1,numel(input));%sms_rlst_der=0;
% 
% for i = 1:numel(input)
%     if(input(i)>epislon)
%         sms_rlst_der(i)=1;
%     end
%     
%     if(-epislon<=input(i) && input(i)<=epislon)
%         sms_rlst_der(i)=2*(input(i)+epislon)/(4*epislon);
%     end
% end


end




