function [l, L_rf, L_sf, L_k, L_seg, L_n] = ...
    retroProjHmgLinFromPinHoleOnRob(Rf, Sf, k, seg, n)

% RETROPROJHMGLINFROMPINHOLEONROB retroprj Hmg Line from pinhole on robot.

%   Copyright 2009 Teresa Vidal.


if nargout == 1
    
    ls = invPinHoleHmgLin(k, seg, n) ;
    lr = fromFrameHmgLin(Sf, ls);
    l  = fromFrameHmgLin(Rf, lr);
    
else % Jacobians requested
    
    [ls, LS_seg, LS_n, LS_k] = invPinHoleHmgLin(seg, n, k) ;
    [lr, LR_sf, LR_ls]       = fromFrameHmgLin(Sf, ls);
    [l, L_rf, L_lr]          = fromFrameHmgLin(Rf, lr);

    L_sf  = L_lr*LR_sf;
    L_ls  = L_lr*LR_ls;
    L_k   = L_ls*LS_k;
    L_seg = L_ls*LS_seg;
    L_n   = L_ls*LS_n;
    
end



% ========== End of function - Start GPL license ==========


%   # START GPL LICENSE

%---------------------------------------------------------------------
%
%   This file is part of SLAMTB, a SLAM toolbox for Matlab.
%
%   SLAMTB is free software: you can redistribute it and/or modify
%   it under the terms of the GNU General Public License as published by
%   the Free Software Foundation, either version 3 of the License, or
%   (at your option) any later version.
%
%   SLAMTB is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%   GNU General Public License for more details.
%
%   You should have received a copy of the GNU General Public License
%   along with SLAMTB.  If not, see <http://www.gnu.org/licenses/>.
%
%---------------------------------------------------------------------

%   SLAMTB is Copyright 2007,2008,2009 
%   by Joan Sola, David Marquez and Jean Marie Codol @ LAAS-CNRS.
%   See on top of this file for its particular copyright.

%   # END GPL LICENSE

