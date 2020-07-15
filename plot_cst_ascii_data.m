% Tool to import and plot CST MWS s-parameter ASCII_files.
% Author: Simon Nickl
% RMIT University 2020
%
%% User input:
file_path = 'H:\Simon_data\s_1_1_2_1.txt'; 
n_data_pts = 1001; % Number of data points in CST (1001 is default).
n_s_para = 2; % Number of different s-parameters.

% Customize plot:
plt.color = {'b -', 'r -'};      % Plot color and line style (b, g, r, y, k, ...; -, --, ...).
plt.line_width = 2;     % Line width.
plt.xlabel = 'Frequency (THz)'; % x-axis label.
plt.ylabel = 'S-Parameter';     % y-axis label.
plt.title = 'S-Parameters';     % Plot title.
plt.legend = {'s_1_1', 's_2_1'};           % Legend.
plt.legend_pos = 'northeast';   % Legend position ('north', 'south', 'northwest', ...).
plt.legend_tc = 'k';            % Legend text color (b, g, r, y, k, ...).

%% Load ASCII data:
s_params = cst_ascii_import(file_path, n_data_pts, n_s_para);

%% Plot data
for i = 1:n_s_para
    hold on
    plot(s_params{i,1}{1,1}(:,1), s_params{i,1}{1,1}(:,2), plt.color{i}, 'LineWidth', plt.line_width, 'DisplayName', plt.legend{i});
    hold off
end
xlim([s_params{1,1}{1,1}(1,1), s_params{1,1}{1,1}(end,1)]);
xlabel(plt.xlabel);
ylabel(plt.ylabel);
title(plt.title);
legend('Location','northeast', 'TextColor', 'k');