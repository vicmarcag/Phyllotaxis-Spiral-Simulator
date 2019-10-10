% ----------------------------------------------------------------------- %
% Function 'phyllotaxis' simulates a phyllotaxis spiral arrangement, such %
% as that observed in many plants (e.g., sunflowers). Note that the actual%
% original angle is 360/phi^2, where phi is the golden ratio.             %
%                                                                         %
%   Input parameters:                                                     %
%       - angle:      	(Optional, default: 360/phi^2) Spiral angle.      %
%       - c:         	(Optional, default: 2) Scaling factor.            %
%       - sizes:        (Optional, default: [10 50]) Variation of the     %
%                       scatter points' sizes from the center to the end. %
%       - fig_handle:   (Optional) Figure handle to plot the result.      %
% ----------------------------------------------------------------------- %
%   Versions:                                                             %
%       - 1.0:          (10/10/2019) Original script.                     %
% ----------------------------------------------------------------------- %
%   Script information:                                                   %
%       - Version:      1.0.                                              %
%       - Author:       V. Martínez-Cagigal                               %
%       - Date:         21/09/2019                                        %
% ----------------------------------------------------------------------- %
%   Example of use:                                                       %
%       phyllotaxis;                                                      %
% ----------------------------------------------------------------------- %
%   Reference:                                                            %
%       Prusinkiewicz, P., & Lindenmayer, A. (2012). The algorithmic beauty
%       of plants. Springer Science & Business Media.                     %
%       Free access here:                                                 %
%           http://algorithmicbotany.org/papers/abop/abop-ch4.pdf         %
% ----------------------------------------------------------------------- %
function phyllotaxis(angle, c, sizes, fig_handle)

    % Default values
    if nargin < 4, fig_handle = figure; end
    if nargin < 3, sizes = [10 50]; end
    if nargin < 2, c = 2; end
    if nargin < 1
        golden_ratio = (1 + sqrt(5))/ 2;
        angle = (360/golden_ratio^2);
    end
        
    % Parameters
    lims = [80 60]; 	% X and Y axis limits
    N_max = 5*10e4;     % Max. number of points (to avoid computation cost)
    
    % Compute the required number of points to fill the screen
    N = (sqrt(sum(lims.^2))^2)/(c^2); 
    if N > N_max, N = N_max; end
    n = 0:1:N;

    % Compute coordinates of each point
    phi = n.*(angle.*pi./180);
    rho = c.*sqrt(n);
    [x, y] = pol2cart(phi, rho);

    % Color and size variations
    c_hsv = [(mod(n.*angle-rho, 360)./360)', ones(N+1,1), ones(N+1,1)];
    c_rgb = hsv2rgb(c_hsv);
    s = linspace(sizes(1), sizes(2), N+1);

    % Plot the result
    set(fig_handle, 'Color',[51 51 51]./255);
    scatter(fig_handle, x, y, s, c_rgb, 'filled');
    axis equal;
    axis([-lims(1) lims(1) -lims(2) lims(2)]);
    axis off;
end