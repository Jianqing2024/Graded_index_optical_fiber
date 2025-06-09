import importlib.util
import numpy as np
from scipy.io import savemat

lumapi_path = "D:\\Program Files\\Lumerical\\v241\\api\\python\\lumapi.py"
#lumapi_path = "D:\\software\\AnsysOptic\\Lumerical\\v231\\api\\python\\lumapi.py"

spec = importlib.util.spec_from_file_location("lumapi", lumapi_path)

if spec is None or spec.loader is None:
    raise ImportError("无法加载 lumapi 模块或 loader 为空")

lumapi = importlib.util.module_from_spec(spec)

fdtd = lumapi.FDTD(hide=False)

fdtd.load("test0.fsp")
aaa = fdtd.getdata("plane", "Ex")

a = np.abs(aaa)**2
a_squeezed = np.squeeze(a)

savemat('data.mat', {'data': a_squeezed})