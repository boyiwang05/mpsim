function sfc = snr_setup_sfc_material_interpolated (...
frequency, material_bottom, material_top, material, sfc)
    if isfieldempty(material, 'interp_method')
        %material.interp_method = 'cubic';  % WRONG!
        material.interp_method = 'linear';  % more conservative.
    end
    material.fnc_property = @(depth, param) interp1(...
        param.property_depth, param.property_sample, depth, ...
        material.interp_method, 'extrap');
    material.property_param = getfields(material, {'property_depth','property_sample'});
    sfc = snr_setup_sfc_material_parametric (...
        frequency, material_bottom, material_top, material, sfc);
    if min(sfc.depth_midpoint) < min(material.property_depth) ...
    || max(sfc.depth_midpoint) > max(material.property_depth)
        warning('snr:snr_setup_sfc_material_interpolated:Extrap', ...
            'Extrapolating property "%s" of material "%s".', ...
            material.property_name, material.name);
    end    
end
