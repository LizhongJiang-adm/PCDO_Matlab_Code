% =========================================================================
% Main script for solving the PFBF Problem with 2 Path Constraints
% using the Upper-Bound Method.
% =========================================================================
% Description:
% This script sets up the PFBF problem with two path constraints,
% configures the CasADi-based Upper-Bound solver, runs the optimization,
% and visualizes the results.
%
% Author: [Lizhong Jiang]
% Contact: [LizhongJiang_adm@163.com]
% Date: [2025/11/29]
% =========================================================================

%% --- 1. Configuration ---
ExecutionMode = 'Solve'; % Options: 'Solve', 'Benchmark'


%% --- 2. Initialization ---
clearvars -except ExecutionMode;
clc;
close all;

try
    import casadi.*
catch
    error('CasADi not found! Please download and add CasADi to your MATLAB path.');
end


%% --- 3. Setup Problem and Options ---
fprintf('Step 1: Defining the PFBF problem with 2 path constraints...\n');
problem = define_PFBF_2constr_problem(); % Call the new problem definition file

fprintf('Step 2: Configuring solver options for the Upper-Bound Method...\n');
options = define_solver_options_UB();


%% --- 4. Execute Based on Selected Mode ---
switch ExecutionMode
    case 'Solve'
        % --- SINGLE RUN MODE with VISUALIZATION ---
        fprintf('\n--- Execution Mode: Solve ---\n');
        options.fmincon.Display = 'iter';
        
        fprintf('Step 3: Running the Upper-Bound solver...\n');
        [solution, stats] = solve_with_UB_CasADi(problem, options);
        Visualization_PFBF_2constr
        fprintf('\nStep 4: Visualizing results...\n');
       
    case 'Benchmark'
        % --- PERFORMANCE BENCHMARK MODE ---
        fprintf('\n--- Execution Mode: Benchmark ---\n');
        options.fmincon.Display = 'none';
        
        fprintf('Step 3: Measuring performance with timeit...\n');
        f_to_time = @() solve_with_UB_CasADi(problem, options);
        execution_time = timeit(f_to_time);
        
        fprintf('---------------------------------------------------\n');
        fprintf('Benchmark Result for PFBF with 2 Constraints (Upper-Bound Method):\n');
        fprintf('Control Intervals (N): %d\n', problem.N);
        fprintf('Average execution time: %.4f seconds\n', execution_time);
        fprintf('---------------------------------------------------\n');
        
    otherwise
        error("Invalid ExecutionMode selected. Choose 'Solve' or 'Benchmark'.");
end

fprintf('\n--- PFBF with 2 Constraints (Upper-Bound Method) Workflow Complete ---\n');