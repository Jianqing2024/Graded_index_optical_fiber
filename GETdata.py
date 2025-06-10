import importlib.util
import numpy as np
from scipy.io import savemat

#lumapi_path = "D:\\Program Files\\Lumerical\\v241\\api\\python\\lumapi.py"
lumapi_path = "D:\\software\\AnsysOptic\\Lumerical\\v231\\api\\python\\lumapi.py"

spec = importlib.util.spec_from_file_location("lumapi", lumapi_path)

if spec is None or spec.loader is None:
    raise ImportError("无法加载 lumapi 模块或 loader 为空")

lumapi = importlib.util.module_from_spec(spec)
spec.loader.exec_module(lumapi)

fdtd = lumapi.FDTD(hide=False)

fdtd.load("TD3.fsp")
aaa = fdtd.getdata("monitor", "Ex")

bbb = fdtd.getdata("monitor_1", "Ex")

ccc = fdtd.getdata("monitor_2", "Ex")

a = np.abs(aaa)**2
a_squeezed = np.squeeze(a)

b = np.abs(bbb)**2
b_squeezed = np.squeeze(b)

c = np.abs(ccc)**2
c_squeezed = np.squeeze(c)

savemat('dataa.mat', {'dataa': a_squeezed})
savemat('datab.mat', {'datab': b_squeezed})
savemat('datac.mat', {'datac': c_squeezed})