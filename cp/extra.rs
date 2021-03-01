#[macro_export]
macro_rules! cin {
    ($dt:ty) => (sc.token::<$dt>());
    ($dt:ty, $n:expr) => {
        {
            let mut arr: [$dt; $n] = [0; $n];
            for i in 0..$n {
                arr[i] = sc.token::<$dt>();
            }
            arr
        }
    };
}