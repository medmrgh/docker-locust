from locust import HttpLocust, TaskSet, task

class MyDemoTaskSet(TaskSet):
    
    @task
    def my_first_demo_task(self):
        self.client.get("/")

    @task
    def my_second_demo_tasks(self):
        self.client.get("/stats/requests")

    @task
    def my_third_demo_task(self):
        self.client.get("/fail/request")

class MyLocust(HttpLocust):
    task_set = MyDemoTaskSet
    min_wait = 5000
    max_wait = 15000
