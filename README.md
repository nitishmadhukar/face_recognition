# Face Recognition
Uses DeepFace library and builds on top of various face analysis models.

## Prerequisites
1. Install Docker with 8GB or 16GB memory

## Available patterns
`Verify` - Verifies if two images are of the same person
`Analyze` - Analyzes the `age` and `gender` of the person in the image

## Steps to Run
1. Clone the repo
2. `cd` into the repo
3. Create a folder `database` inside the cloned repo
4. Place images to compare inside the folder structure `database/verify/pair_1/image1.jpeg` and `database/verify/pair_1/image2.jpeg`
5. Place images to analyze inside the folder structure `database/analyze/image1.jpeg`, `database/analyze/image2.jpeg` and so on
6. Run `docker build -t facial_recognition .`
7. Run `docker run -p 3000:5000 facial_recognition` (Choose another port if 3000 is busy on local machine)
8. Run `curl -X POST http://127.0.0.1:3000/verify -H 'cache-control: no-cache' -H 'content-type: application/json' -d ' {}'` to compare two images saved in `database/verify/pair_1/`
9. Run `curl -X POST http://127.0.0.1:3000/analyze -H 'cache-control: no-cache' -H 'content-type: application/json' -d ' {}'` to analyze images saved in `database/analyze/`


## Sample response
**For Analyze**
```
{
    "instance_1": {
        "age": 52,
        "gender": "Man"
    },
    "instance_2": {
        "age": 51,
        "gender": "Man"
    }
}
```

**For Verify**
```
{
    "pair_1": "Are the images matching? - True"
}
```
