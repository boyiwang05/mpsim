% (this is just an interface)
function varargout = get_reflection_coeff_homogeneous (varargin)
    [varargout{1:nargout}] = get_reflection_coeff_circ (varargin{:});
end
