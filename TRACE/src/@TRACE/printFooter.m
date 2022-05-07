% Copyright (C) 2022 Frank E. Curtis, Daniel P. Robinson, Qi Wang
%
% All Rights Reserved.

% TRACE: printFooter
function printFooter(T)

% Print termination message
switch T.status
  case Enumerations.S_UNSET
    T.reporter.printf(Enumerations.R_SOLVER,Enumerations.R_BASIC,...
      '\nEXIT: Status unset!\n\n');
  case Enumerations.S_SUCCESS
    T.reporter.printf(Enumerations.R_SOLVER,Enumerations.R_BASIC,...
      '\nEXIT: Stationary point found.\n\n');
  case Enumerations.S_CPU_TIME_LIMIT
    T.reporter.printf(Enumerations.R_SOLVER,Enumerations.R_BASIC,...
      '\nEXIT: CPU time limit exceeded.\n\n');
  case Enumerations.S_SIZE_LIMIT
    T.reporter.printf(Enumerations.R_SOLVER,Enumerations.R_BASIC,...
      '\nEXIT: Size limit exceeded.\n\n');
  case Enumerations.S_ITERATION_LIMIT
    T.reporter.printf(Enumerations.R_SOLVER,Enumerations.R_BASIC,...
      '\nEXIT: Iteration limit exceeded.\n\n');
  case Enumerations.S_EVALUATION_LIMIT
    T.reporter.printf(Enumerations.R_SOLVER,Enumerations.R_BASIC,...
      '\nEXIT: Evaluation limit exceeded.\n\n');
  case Enumerations.S_STEP_COMPUTATION_FAILURE
    T.reporter.printf(Enumerations.R_SOLVER,Enumerations.R_BASIC,...
      '\nEXIT: Step computation failure.\n\n');
  case Enumerations.S_ACCEPTABILITY_CHECK_FAILURE
    T.reporter.printf(Enumerations.R_SOLVER,Enumerations.R_BASIC,...
      '\nEXIT: Acceptability check failure.\n\n');
  otherwise
    T.reporter.printf(Enumerations.R_SOLVER,Enumerations.R_BASIC,...
      '\nEXIT: Status unknown!\n\n');
end % switch

% Print quantities footer
T.reporter.printf(Enumerations.R_SOLVER,Enumerations.R_BASIC,...
  ['Objective......................... : %+e\n'...
  'Objective (unscaled).............. : %+e\n'...
  'Stationarity error................ : %+e\n'...
  'Iterations........................ : %d\n'...
  'Inner iterations.................. : %d\n'...
  'Objective function evaluations.... : %d\n'...
  'Objective gradient evaluations.... : %d\n'...
  'Objective Hessian evaluations..... : %d\n'...
  'CPU seconds....................... : %d\n'],...
  T.quantities.currentIterate.objectiveFunction(T.quantities),...
  T.quantities.currentIterate.objectiveFunctionUnscaled(T.quantities),...
  T.quantities.currentIterate.stationarityError(T.quantities),...
  T.quantities.iterationCounter,...
  T.quantities.innerIterationTotalCounter,...
  T.quantities.objectiveFunctionEvaluationCounter,...
  T.quantities.objectiveGradientEvaluationCounter,...
  T.quantities.objectiveHessianEvaluationCounter,...
  T.quantities.cpuTime);

end % printFooter