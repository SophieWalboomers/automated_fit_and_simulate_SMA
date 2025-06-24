function  x=min_alog_composition(p,v)
% p(1) and p(2) are the parameters for the alogistic function composed (with id) by the min operator;
% the alogistic function is applied to the first 7 values of v and the id function to the 8th value.
x = composedbcfs(25,[1 1],[2 21],[p(1) p(2) 0 0], v, [7 1]);
end

% composedbcfs: x = bcf(h,p,bcfvalues(nrs,ps,vs,ks));
% h: 25 (smin)              = the number h of the composing function.
% p: [1 1]                  = a list of parameter values of this composing function indicated by h.
% nrs: [2 21] (alog, id)    = a list for the numbers of the collection of composed functions.
% ps: [p(1) p(2) 0 0]       = a list for their parameters.
% vs:                       = a list for their values.
% ks:                       = a list of the numbers of their arguments used.

