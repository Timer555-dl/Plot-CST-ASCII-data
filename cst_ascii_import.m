%% Load CST ASCII files.
% Author: Simon Nickl
% RMIT 2020
%
% Input:
% f_name: Filname with stored s-parameters.
% numlines: Number of s-param data points.
% num_params: Number of s-parameters.
%
% Output:
% s_params: Cell array of s-parameters.

function [s_params] = cst_ascii_import(f_name, numlines, num_params)
    line_counter = numlines + 1; % Take empty line after each S-param into account.
    skip_row = 2;
    s_params = cell(num_params, 1);
    
    for i = 1:num_params
        fid = fopen(f_name, 'r');
        s_params{i} = textscan(fid, '%f%f', numlines, 'HeaderLines', skip_row, 'CollectOutput', 1);
        skip_row = skip_row + line_counter + 2;
        fclose(fid);
    end
end

