# Phyllotaxis-Spiral-Simulator
This MATLAB GUI simulates the Phyllotaxis spiral arragement that is common in nature.

**NOTE: Please vote my contribution in MathWorks if you liked it! Thanks!
https://es.mathworks.com/matlabcentral/fileexchange/72984-phyllotaxis-spiral-simulator
**

<p align="center">
  <img src="https://es.mathworks.com/matlabcentral/mlc-downloads/downloads/9e8426f4-ae35-4e22-b351-b74c29aebd44/b28fd01c-0fa7-4051-9aa8-7ca091b73f89/images/screenshot.png" width="500">
</p>

Phyllotaxis is the arrangement of leaves on a plant stem, such as those observed in sunflowers. The GUI (gui_phyllotaxis.m) offers a simulator to play with the parameters that create the final spiral. Note that the original angle is (360/phi^2), where phi is the golden ratio!

Example of use:
gui_phyllotaxis;

--------------------------------------------------------------------------------------------------------
The main function is 'phyllotaxis(angle, c, sizes, fig_handle)', the rest of them are required to plot the GUI. Thus, this function can be used separately. 

Input parameters:
- angle:      	(Optional, default: 360/phi^2) Spiral angle.
- c:         	(Optional, default: 2) Scaling factor.
- sizes:        (Optional, default: [10 50]) Variation of the scatter points' sizes from the center to the end.
- fig_handle:   (Optional) Figure handle to plot the result.

Example of use:
phyllotaxis;

Do you want to know more? Check http://algorithmicbotany.org/papers/abop/abop-ch4.pdf.
