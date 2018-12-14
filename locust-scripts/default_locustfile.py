from locust import HttpLocust, TaskSet, task

class MyTaskSet(TaskSet):
    
    @task
    def my_first_task(self):
        self.client.get("/")

    @task
    def my_second_tasks(self):
        self.client.get("/stats/requests")

    @task
    def my_third_task(self):
        self.client.get("/fail/request")

class MyLocust(HttpLocust):
    task_set = MyTaskSet
    min_wait = 5000
    max_wait = 15000
