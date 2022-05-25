% Copyright (C) 2022 Frank E. Curtis, Daniel P. Robinson, Qi Wang
%
% All Rights Reserved.

function testTRACECUTEst(cutest_problem_name)

% Add source code to path
addpath('../problems/');
addpath('../src/');
if startsWith(pwd,'/Users/wangqi/')
    % local conf
    cutest_path='/usr/local/opt/cutest/libexec/src/matlab';
    cutest_problem_path='/Users/wangqi/Desktop/Utilities/CUTEst2Matlab/decoded';
else
    % remote polyps conf
    cutest_path='/home/qiw420/linux-cutest/cutest/src/matlab';
    cutest_problem_path='/home/qiw420/Utilities/CUTEst2Matlab/decoded';
end
addpath(cutest_path)

% Record current directory
cur_pwd = pwd;

% Move to problem directory
cd(sprintf('%s/%s',cutest_problem_path,cutest_problem_name));

% Declare algorithm
T = TRACE;
%T.options.modifyOption(T.reporter, 'tolerance', 1e-4);
% Declare problem
P = ProblemCUTEst;

% Optimize
T.optimize(P);

% Call problem descructor
delete(P);

% Return to original directory
cd(cur_pwd);
