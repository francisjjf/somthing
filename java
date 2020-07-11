java:


线程池：
Executors：                      核心线程        总线程         队列
newSingleThreadExecutor             1               1           无界LinkedBlockingQueue
newFixedThreadPool                  n               n           无界无界LinkedBlockingQueue
newCachedThreadPool                 0               max         SynchronousQueue*
newThreadScheduledExecutor*


1. SynchronousQueue：内部只能包含一个元素的队列。插入元素到队列的线程被阻塞，直到另一个线程从队列中获取了队列中存储的元素。
2. newThreadScheduledExecutor：
scheduleAtFixedRate:循环任务，按照上一次任务的发起时间计算下一次任务的开始时间
scheduleWithFixedDelay:循环任务，按照上一次任务的发起时间计算下一次任务的开始时间


public ThreadPoolExecutor(
    int corePoolSize， 
    int maximumPoolSize， 
    long keepAIiveTime ,
    TimeUnit unit，
    BlockingQueue<Runna ble> workQueue,
    ThreadFactory threadFactory, 
    RejectedExecutionHandler handler) {……}

分布式锁：
redis
zookeeper


spring：
aop 切面编程：日志记录，性能统计，安全控制，事务处理，异常处理
样例：
@Aspect
public class AuthAspect {
	
	//定义切点
	@Pointcut("execution(* com.cnblogs.hellxz.service.*.*(..))")
	public void pointCut() {}
	
	//前置处理
	@Before("pointCut()")
	public void auth() {
		System.out.println("模拟权限检查……");
	}
}

ioc：控制反转，降低耦合
