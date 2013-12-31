import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;


/*
 * this class will convert a large count of documents to swf files as a batch job
 * ConvertJob is one convert job for convert only one document.
 */
public class BatchJobRunner {

  public void run() {

    ExecutorService threadsPool = Executors.newFixedThreadPool(5);

    /**
     * - start for 1092760 to 1116994 art for 1213935 to 1238169
     */
    int[][] runs = Utils.splitRange(2207177, 2207178, 1);
    for (int i = 0; i < runs.length; i++) {
      threadsPool.execute(new BatchJob(runs[i][0], runs[i][1]));
    }

    (new Thread(new TimeoutTaskKiller())).start();

    boolean f = true;

    threadsPool.shutdown();
    // [TODO: add for java222 哈哈]
    /** [TODO: comment2222 ] */
    try {
      while (!threadsPool.awaitTermination(60, TimeUnit.SECONDS)) {
        System.out.println("wait for thread pool to shutdown");
      }
    } catch (InterruptedException e) {
      System.out.println("await thread error");
    }

  }

}
