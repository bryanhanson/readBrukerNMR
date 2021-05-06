def import_1D_pdata(file):

    import nmrglue as ng
    dic, data = ng.bruker.read_pdata(file)
    udic = ng.bruker.guess_udic(dic, data)
    uc = ng.fileiobase.uc_from_udic(udic)
    ppm_scale = uc.ppm_scale()
    return {"params": dic, "x": ppm_scale, "y": data}
