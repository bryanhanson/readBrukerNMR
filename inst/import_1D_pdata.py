# from pprint import pprint as pp


def import_pdata(file):

    import nmrglue as ng
    dic, data = ng.bruker.read_pdata(file)
    udic = ng.bruker.guess_udic(dic, data)
    uc = ng.fileiobase.uc_from_udic(udic)
    ppm_scale = uc.ppm_scale()
    return {"params": dic, "x": ppm_scale, "y": data}


# ans = import_pdata("bmse000233/nmr/set01/1H/pdata/1")
# pp(ans)
