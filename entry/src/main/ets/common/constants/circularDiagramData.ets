export const circularDiagramData: CircularDiagramData[] = [
  {
    date: '2024-09-18',
    totalTime: 600,
    consumeTime: 100,
    totalTasks: 12,
    completedTasks: 2,
    onGoingTasks: 6
  },
  {
    date: '2024-09-19',
    totalTime: 800,
    consumeTime: 400,
    totalTasks: 12,
    completedTasks: 6,
    onGoingTasks: 8
  },
  {
    date: '2024-09-20',
    totalTime: 1200,
    consumeTime: 800,
    totalTasks: 20,
    completedTasks: 6,
    onGoingTasks: 4
  },
  {
    date: '2024-09-21',
    totalTime: 1000,
    consumeTime: 400,
    totalTasks: 20,
    completedTasks: 6,
    onGoingTasks: 4
  }
]

interface CircularDiagramData {
  date: string
  totalTime: number
  consumeTime: number
  totalTasks: number
  completedTasks: number
  onGoingTasks: number
}